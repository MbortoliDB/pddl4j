/*
 * Copyright (c) 2010 by Damien Pellier <Damien.Pellier@imag.fr>.
 *
 * This file is part of PDDL4J library.
 *
 * PDDL4J is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PDDL4J is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
 */

package fr.uga.pddl4j.problem;

import fr.uga.pddl4j.encoding.AbstractGroundOperator;
import fr.uga.pddl4j.encoding.Inertia;
import fr.uga.pddl4j.parser.PDDLConnective;
import fr.uga.pddl4j.parser.PDDLSymbol;
import fr.uga.pddl4j.plan.HDDLCertificate;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.util.BitMatrix;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * This class implements a problem where operators (actions and methods) are instantiated and encoded into compact
 * representation.
 *
 * @author D. Pellier
 * @version 1.0 - 10.06.2010
 */
public class Problem implements Serializable {

    /**
     * The table of the type symbols.
     */
    private List<String> typeSymbols;

    /**
     * The table of inferred domains based on unary inertia encoding.
     */
    private List<Set<Integer>> inferredDomains;

    /**
     * The domain of associated to the type.
     */
    private List<Set<Integer>> domains;

    /**
     * The table of the constant symbols.
     */
    private List<String> constantSymbols;

    /**
     * The table of the predicate symbols.
     */
    private List<String> predicateSymbols;

    /**
     * The table that contains the typeSymbols of the arguments of the predicateSymbols.
     */
    private List<List<Integer>> predicatesSignatures;

    /**
     * The table of the function symbols.
     */
    private List<String> functionSymbols;

    /**
     * The table of task symbols.
     */
    private List<String> taskSymbols;

    /**
     * The table that contains the types of the arguments of the tasks.
     */
    private List<List<Integer>> tasksSignatures;

    /**
     * The table that contains the types of the arguments of the functions.
     */
    private List<List<Integer>> functionsSignatures;

    /**
     * The table that defines for each predicate its type of inertia.
     */
    private List<Inertia> inertia;

    /**
     * The table of the relevant fluents.
     */
    private List<Fluent> relevantFluents;

    /**
     * The table gives for each task the list of relevant operators, i.e., action or methods that may achieve it.
     */
    private List<List<Integer>> relevantOperators;

    /**
     * The list of instantiated actions encoded into bit sets.
     */
    private List<Action> actions;

    /**
     * The list of instantiated methods encoded into bit sets.
     */
    private List<Method> methods;

    /**
     * The table of tasks of the problem.
     */
    private List<Task> tasks;

    /**
     * The goal.
     */
    private State goal;

    /**
     * The initial state.
     */
    private State initialState;

    /**
     * The initial task network.
     */
    private TaskNetwork initialTaskNetwork;

    /**
     * Create a new empty problem. All the attributs of the problem are initialize with null.
     */
    public Problem() {
        super();
    }

    /**
     * Create a new <code>Problem</code> copy of another.
     *
     * @param other the other <code>Problem</code>;
     */
    public Problem(Problem other) {
        super();
        this.typeSymbols = new ArrayList<>();
        this.typeSymbols.addAll(other.typeSymbols.stream().collect(Collectors.toList()));
        this.domains = new ArrayList<>();
        for (Set<Integer> si : other.domains) {
            final Set<Integer> copy = si.stream().collect(Collectors.toCollection(LinkedHashSet::new));
            this.domains.add(copy);
        }
        this.constantSymbols = new ArrayList<>();
        this.constantSymbols.addAll(other.constantSymbols.stream().collect(Collectors.toList()));
        this.predicateSymbols = new ArrayList<>();
        this.predicateSymbols.addAll(other.predicateSymbols.stream().collect(Collectors.toList()));
        this.predicatesSignatures = new ArrayList<>();
        for (List<Integer> si : other.predicatesSignatures) {
            final List<Integer> copy = si.stream().collect(Collectors.toList());
            this.predicatesSignatures.add(copy);
        }
        this.taskSymbols = new ArrayList<>();
        this.taskSymbols.addAll(other.taskSymbols.stream().collect(Collectors.toList()));
        this.tasksSignatures = new ArrayList<>();
        for (List<Integer> si : other.tasksSignatures) {
            final List<Integer> copy = si.stream().collect(Collectors.toList());
            this.tasksSignatures.add(copy);
        }
        this.functionSymbols = new ArrayList<>();
        this.functionSymbols.addAll(other.functionSymbols.stream().collect(Collectors.toList()));
        this.functionsSignatures = new ArrayList<>();
        for (List<Integer> si : other.functionsSignatures) {
            final List<Integer> copy = si.stream().collect(Collectors.toList());
            this.functionsSignatures.add(copy);
        }
        this.inertia = new ArrayList<>();
        this.inertia.addAll(other.inertia.stream().collect(Collectors.toList()));
        this.relevantFluents = new ArrayList<>();
        this.relevantFluents.addAll(other.relevantFluents.stream().map(Fluent::new).collect(Collectors.toList()));
        this.tasks = new ArrayList<>();
        this.tasks.addAll(other.tasks.stream().map(Task::new).collect(Collectors.toList()));
        this.actions = new ArrayList<>();
        this.actions.addAll(other.actions.stream().map(Action::new).collect(Collectors.toList()));
        this.methods = new ArrayList<>();
        this.methods.addAll(other.methods.stream().map(Method::new).collect(Collectors.toList()));
        if (other.goal != null) {
            this.goal = new State(other.goal);
        }
        this.initialState = new State(other.initialState);
        if (other.initialTaskNetwork != null) {
            this.initialTaskNetwork = new TaskNetwork(other.initialTaskNetwork);
        }
        this.relevantOperators = new ArrayList<>(other.relevantOperators.size());
        for (List<Integer> ti : other.relevantOperators) {
            final List<Integer> copy = ti.stream().collect(Collectors.toList());
            this.relevantOperators.add(copy);
        }
    }

    /**
     * Returns the list of the type symbols of the problem.
     *
     * @return the list of the type symbols of the problem.
     */
    public final List<String> getTypeSymbols() {
        return this.typeSymbols;
    }

    /**
     * Sets the list of type symbols of the problem.
     *
     * @param types the list of type symbols to set
     */
    public final void setTypeSymbols(final List<String> types) {
        this.typeSymbols = types;
    }

    /**
     * Returns the type inferred. Types are inferred when the key work either is used.
     *
     * @return the inferredDomains
     */
    public final List<Set<Integer>> getInferredDomains() {
        return this.inferredDomains;
    }

    /**
     * Sets the inferred domain of the problem.
     *
     * @param inferredDomains the inferredDomains to set.
     */
    public final void setInferredDomains(final List<Set<Integer>> inferredDomains) {
        this.inferredDomains = inferredDomains;
    }

    /**
     * Returns the table of domains for each type of the problem.
     *
     * @return the table of domains for each type of the problem.
     */
    public final List<Set<Integer>> getDomains() {
        return this.domains;
    }

    /**
     * Set the domains corresponding at each typeSymbols of the problem.
     *
     * @param domains the domains to set.
     */
    public final void setDomains(final List<Set<Integer>> domains) {
        this.domains = domains;
    }

    /**
     * Returns the list of constant symbols of the problem.
     *
     * @return the list of constant symbols of the problem.
     */
    public final List<String> getConstantSymbols() {
        return this.constantSymbols;
    }

    /**
     * Sets the list constant symbols of the problem.
     *
     * @param constants the list of constant symbols to set
     */
    public final void setConstantSymbols(final List<String> constants) {
        this.constantSymbols = constants;
    }

    /**
     * Returns the list of predicate symbols of the problem.
     *
     * @return the list predicate symbols of the problem.
     */
    public final List<String> getPredicateSymbols() {
        return this.predicateSymbols;
    }

    /**
     * Sets the list of predicate symbols of the problem.
     *
     * @param predicates the list of predicate symbols to set.
     */
    public final void setPredicateSymbols(final List<String> predicates) {
        this.predicateSymbols = predicates;
    }

    /**
     * Returns the signatures of the predicates defined in the problem.
     *
     * @return the signatures of the predicates defined in the problem.
     */
    public final List<List<Integer>> getPredicatesSignatures() {
        return this.predicatesSignatures;
    }

    /**
     * Sets the signatures of the predicates defined in the problem.
     *
     * @param signatures the signatures of the predicates defined in the problem.
     */
    public final void setPredicatesSignatures(final List<List<Integer>> signatures) {
        this.predicatesSignatures = signatures;
    }

    /**
     * Returns the list of task symbols of the problem.
     *
     * @return the list of task symbols of the problem.
     */
    public final List<String> getTaskSymbols() {
        return this.taskSymbols;
    }

    /**
     * Sets the list of task symbols of the problem.
     *
     * @param tasks the list of task symbols to set.
     */
    public final void setTaskSymbols(final List<String> tasks) {
        this.taskSymbols = tasks;
    }

    /**
     * Returns the signatures of the task defined in the problem.
     *
     * @return the signatures of the task defined in the problem.
     */
    public final List<List<Integer>> getTasksSignatures() {
        return this.tasksSignatures;
    }

    /**
     * Sets the signatures of the task defined in the problem.
     *
     * @param signatures the signatures of the task defined in the problem.
     */
    public final void setTasksSignatures(final List<List<Integer>> signatures) {
        this.tasksSignatures = signatures;
    }

    /**
     * Returns the list of function symbols of the problem.
     *
     * @return the list of function symbols of the problem.
     */
    public final List<String> getFunctionSymbols() {
        return this.functionSymbols;
    }

    /**
     * Sets the list of function symbols of the problem.
     *
     * @param functions the list of function symbols to set.
     */
    public final void setFunctionSymbols(final List<String> functions) {
        this.functionSymbols = functions;
    }

    /**
     * Returns the signatures of the functions defined in the problem.
     *
     * @return the signatures of the functions defined in the problem.
     */
    public final List<List<Integer>> getFunctionsSignatures() {
        return this.functionsSignatures;
    }

    /**
     * Sets the signatures of the function defined in the problem.
     *
     * @param signatures the signatures of the function defined in the problem.
     */
    public final void setFunctionsSignatures(final List<List<Integer>> signatures) {
        this.functionsSignatures = signatures;
    }

    /**
     * Returns the inertia status of the predicates defined in the problem.
     *
     * @return the inertia status of the predicates defined in the problem.
     */
    public final List<Inertia> getInertia() {
        return this.inertia;
    }

    /**
     * Sets the inertia status of the predicates defined in the problem.
     *
     * @param inertia the inertia to set.
     */
    public final void setInertia(final List<Inertia> inertia) {
        this.inertia = inertia;
    }

    /**
     * Returns the list of relevant fluents used the problem.
     *
     * @return the list of relevant fluents used the problem.
     */
    public final List<Fluent> getRelevantFluents() {
        return this.relevantFluents;
    }

    /**
     * Sets the list of relevant fluents used the problem.
     *
     * @param fluents the list of relevant fluents to set.
     */
    public final void setRelevantFluents(final List<Fluent> fluents) {
        this.relevantFluents = fluents;
    }

    /**
     * Returns the list of relevant operators, i.e., that may achieve it, for each task of the problem. A relevant
     * operator can be a action or method depending if the task is primitive or not.
     *
     * @return the list of relevant operators for the tasks of the problem.
     */
    public final List<List<Integer>> getRelevantOperators() {
        return this.relevantOperators;
    }

    /**
     * Sets the list of relevant operators, i.e., that may achieve it, for each task of the problem. A relevant
     * operator can be a action or method depending if the task is primitive or not.
     *
     * @param operators the list of operators for the relevant tasks of the problem.
     */
    public final void setTaskResolvers(final List<List<Integer>> operators) {
        this.relevantOperators = operators;
    }

    /**
     * Returns the list of tasks of the problem. The method returns null if the problem is not HTN.
     *
     * @return the list of tasks of the problem.
     */
    public final List<Task> getTasks() {
        return this.tasks;
    }

    /**
     * Sets the list of tasks used the problem.
     *
     * @param tasks the list of tasks to set.
     */
    public final void setTasks(final List<Task> tasks) {
        this.tasks = tasks;
    }

    /**
     * Returns the list of instantiated actions of the problem.
     *
     * @return the list of instantiated actions of the problem.
     */
    public final List<Action> getActions() {
        return this.actions;
    }

    /**
     * Sets the list of instantiated actions of the problem.
     *
     * @param actions the list of instantiated actions of the problem.
     */
    public final void setActions(final List<Action> actions) {
        this.actions = actions;
    }

    /**
     * Returns the list of instantiated methods of the problem. The method returns null if the problem is not HTN.
     *
     * @return the list of instantiated methods of the problem.
     */
    public final List<Method> getMethods() {
        return this.methods;
    }

    /**
     * Sets the list of instantiated methods of the problem.
     *
     * @param methods the list of instantiated methods of the problem.
     */
    public final void setMethods(final List<Method> methods) {
        this.methods = methods;
    }

    /**
     * Returns the goal of the problem or null if the goal can is not reachable. The method returns null if the problem
     * is HTN.
     *
     * @return the goal of the problem.
     */
    public final State getGoal() {
        return this.goal;
    }

    /**
     * Returns <code>true</code> if this problem is solvable, i.e., if its goal was not simplified to FALSE during the
     * encoding or if the problem is an HTN problem.
     *
     * @return <code>true</code> if this problem is solvable; <code>false</code>.
     */
    public final boolean isSolvable() {
        return this.goal != null || this.initialTaskNetwork != null;
    }

    /**
     * Sets the goal of the problem.
     *
     * @param goal the goal to set
     */
    public final void setGoal(final State goal) {
        this.goal = goal;
    }

    /**
     * Returns the initial state of the problem.
     *
     * @return the initial state of the problem.
     */
    public final State getInitialState() {
        return this.initialState;
    }

    /**
     * Sets the initial state of the problem.
     *
     * @param initialState the initial state to set.
     */
    public final void setInitialState(final State initialState) {
        this.initialState = initialState;
    }

    /**
     * Returns the initial task network. This method returns null if the problem is not a HTN problem.
     *
     * @return the initial task network.
     */
    public final  TaskNetwork getInitialTaskNetwork() {
        return this.initialTaskNetwork;
    }

    /**
     * Sets the initial task network of the problem.
     *
     * @param taskNetwork the initial task network.
     */
    public final void  setInitialTaskNetwork(final TaskNetwork taskNetwork) {
        this.initialTaskNetwork = taskNetwork;
    }

    /**
     * Returns a string representation of a specified operator.
     *
     * @param action     the action.
     * @return a string representation of the specified operator.
     */
    public final String toString(final Action action) {
        StringBuilder str = new StringBuilder();
        str.append("Action ").append(action.getName()).append("\n").append("Instantiations:\n");
        for (int i = 0; i < action.arity(); i++) {
            final int index = action.getValueOfParameter(i);
            final String type = this.getTypeSymbols().get(action.getTypeOfParameters(i));
            if (index == -1) {
                str.append(PDDLSymbol.DEFAULT_VARIABLE_SYMBOL);
                str.append(i);
                str.append(" - ");
                str.append(type);
                str.append(" : ? \n");
            } else {
                str.append(PDDLSymbol.DEFAULT_VARIABLE_SYMBOL);
                str.append(i);
                str.append(" - ");
                str.append(type);
                str.append(" : ");
                str.append(this.getConstantSymbols().get(index));
                str.append(" \n");
            }
        }
        str.append("Preconditions:\n");
        str.append(this.toString(action.getPreconditions()));
        str.append("\n");
        str.append("Effects:\n");
        for (ConditionalEffect condExp : action.getCondEffects()) {
            str.append(this.toString(condExp));
            str.append("\n");
        }
        return str.toString();
    }

    /**
     * Returns a string representation of the specified method.
     *
     * @param method the method.
     * @return a string representation of the specified method.
     */
    public final String toString(final Method method) {
        final StringBuilder str = new StringBuilder();
        str.append("Method ");
        str.append(method.getName());
        str.append("\n");
        str.append("Instantiations:\n");
        for (int i = 0; i < method.arity(); i++) {
            final int index = method.getValueOfParameter(i);
            final String type = this.getTypeSymbols().get(method.getTypeOfParameters(i));
            if (index == -1) {
                str.append(PDDLSymbol.DEFAULT_VARIABLE_SYMBOL);
                str.append(i).append(" - ");
                str.append(type);
                str.append(" : ? \n");
            } else {
                str.append(PDDLSymbol.DEFAULT_VARIABLE_SYMBOL).append(i);
                str.append(" - ");
                str.append(type);
                str.append(" : ");
                str.append(this.getConstantSymbols().get(index));
                str.append(" \n");
            }
        }
        str.append("Preconditions:\n");
        str.append(this.toString(method.getPreconditions()));
        str.append("\n");
        str.append(this.toString(method.getTaskNetwork()));
        return str.toString();
    }

    /**
     * Returns a string representation of a state.
     *
     * @param state the state.
     * @return a string representation of the state.
     */
    public final String toString(final State state) {
        final StringBuilder str = new StringBuilder("(and");
        final BitSet positive = state.getPositive();
        for (int j = positive.nextSetBit(0); j >= 0; j = positive.nextSetBit(j + 1)) {
            str.append(" ");
            str.append(this.toString(this.getRelevantFluents().get(j)));
            str.append("\n");
        }
        final BitSet negative = state.getNegative();
        for (int i = negative.nextSetBit(0); i >= 0; i = negative.nextSetBit(i + 1)) {
            str.append(" (not ");
            str.append(this.toString(this.getRelevantFluents().get(i)));
            str.append(")\n");
        }
        str.append(")");
        return str.toString();
    }

    /**
     * Returns a string representation of a closed world state.
     *
     * @param state the state.
     * @return a string representation of the specified expression.
     */
    public final String toString(final ClosedWorldState state) {
        final StringBuilder str = new StringBuilder("(and");
        for (int i = state.nextSetBit(0); i >= 0; i = state.nextSetBit(i + 1)) {
            str.append(" ");
            str.append(this.toString(this.getRelevantFluents().get(i)));
            str.append("\n");
        }
        str.append(")");
        return str.toString();
    }

    /**
     * Returns a string representation of the specified task network.
     *
     * @param tasknetwork the task network.
     * @return a string representation of the specified task network.
     */
    public final String toString(final TaskNetwork tasknetwork) {
        final StringBuilder str = new StringBuilder();
        str.append("Tasks:\n");
        if (tasknetwork.getTasks().isEmpty()) {
            str.append(" ()\n");
        } else {
            for (int i = 0; i < tasknetwork.getTasks().size(); i++) {
                str.append(" " + PDDLSymbol.DEFAULT_TASK_ID_SYMBOL + i + ": ");
                str.append(this.toString(tasks.get(tasknetwork.getTasks().get(i))));
                str.append("\n");
            }
        }
        str.append("Ordering constraints:\n");
        if (tasknetwork.getOrderingConstraints().cardinality() == 0) {
            str.append(" ()");
        } else {
            BitMatrix constraints = tasknetwork.getOrderingConstraints();
            int index = 0;
            for (int r = 0; r < constraints.rows(); r++) {
                BitSet row = constraints.getRow(r);
                for (int c = row.nextSetBit(0); c >= 0; c = row.nextSetBit(c + 1)) {
                    str.append(" C");
                    str.append(index);
                    str.append(": ");
                    str.append(PDDLSymbol.DEFAULT_TASK_ID_SYMBOL + r);
                    str.append(" ");
                    str.append(PDDLConnective.LESS_ORDERING_CONSTRAINT.getImage());
                    str.append(" ");
                    str.append(PDDLSymbol.DEFAULT_TASK_ID_SYMBOL + c);
                    str.append("\n");
                    index++;
                }
            }
        }
        return str.toString();
    }

    /**
     * Returns a string representation of a fluent.
     *
     * @param fluent the formula.
     * @return a string representation of the specified expression.
     */
    public String toString(final Fluent fluent) {
        final StringBuffer str = new StringBuffer();
        str.append("(");
        str.append(this.predicateSymbols.get(fluent.getSymbol()));
        for (Integer arg : fluent.getArguments()) {
            str.append(" ");
            str.append(this.constantSymbols.get(arg));
        }
        str.append(")");
        return str.toString();
    }

    /**
     * Returns a string representation of a task.
     *
     * @param task the formula.
     * @return a string representation of the specified expression.
     */
    public String toString(final Task task) {
        final StringBuffer str = new StringBuffer();
        str.append("(");
        str.append(this.taskSymbols.get(task.getSymbol()));
        for (Integer arg : task.getArguments()) {
            str.append(" ");
            str.append(this.constantSymbols.get(arg));
        }
        str.append(")");
        return str.toString();
    }

    /**
     * Return a string representation of a search.
     *
     * @param plan the search.
     * @return a string representation of the specified search.
     */
    public final String toString(final Plan plan) {
        int max = Integer.MIN_VALUE;
        for (Integer t : plan.timeSpecifiers()) {
            for (Action a : plan.getActionSet(t)) {
                int length = this.toShortString(a).length();
                if (max < length) {
                    max = length;
                }
            }
        }
        final int actionSize = max;
        final int timeSpecifierSize = (int) Math.log10(plan.timeSpecifiers().size()) + 1;

        final StringBuilder str = new StringBuilder();
        plan.timeSpecifiers().forEach(time ->
            plan.getActionSet(time).forEach(a ->
                str.append(String.format("%0" + timeSpecifierSize + "d: (%" + actionSize + "s) [%d]%n",
                    time, this.toShortString(a), ((int) a.getDuration())))));
        return str.toString();
    }

    public final String toString(final HDDLCertificate proof) {

        final StringBuilder str = new StringBuilder();
        for (int i = 0; i < proof.getOperatorIDs().size(); i++) {
            str.append(String.format("%d %s%n", proof.getOperatorIDs().get(i),
                this.toShortString(proof.actions().get(i))));
        }
        return str.toString();
    }

    /**
     * Returns a string representation of a conditional effect.
     *
     * @param ceffect  the conditional effect.
     * @return a string representation of the specified condition effect.
     */
    public final String toString(final ConditionalEffect ceffect) {
        StringBuilder str = new StringBuilder();
        if (ceffect.getCondition().isEmpty()) {
            str.append(this.toString(ceffect.getEffects()));
        } else {
            str.append("(when ");
            str.append(this.toString(ceffect.getCondition()));
            str.append("\n");
            str.append(this.toString(ceffect.getEffects()));
            str.append(")");
        }
        return str.toString();
    }

    /**
     * Returns a short string representation of the specified operator, i.e., its name and its
     * instantiated parameters. This method can be used for actions and methods.
     *
     * @param operator  the operator.
     * @return a string representation of the specified operator.
     */
    public final String toShortString(final AbstractGroundOperator operator) {
        final StringBuilder str = new StringBuilder();
        str.append(operator.getName());
        for (int i = 0; i < operator.arity(); i++) {
            final int index = operator.getValueOfParameter(i);
            if (index == -1) {
                str.append(" ?");
            } else {
                str.append(" ");
                str.append(this.getConstantSymbols().get(index));
            }
        }
        return str.toString();
    }

    /**
     * Return a detailed string representation of a search. Not compatible with VAL.
     *
     * @param plan the search.
     * @return a string representation of the specified search.
     */
    public final String toStringCost(final Plan plan) {
        int max = Integer.MIN_VALUE;
        for (Integer t : plan.timeSpecifiers()) {
            for (Action a : plan.getActionSet(t)) {
                int length = this.toShortString(a).length();
                if (max < length) {
                    max = length;
                }
            }
        }
        final int actionSize = max;
        final int timeSpecifierSize = (int) Math.log10(plan.timeSpecifiers().size()) + 1;

        final StringBuilder str = new StringBuilder();
        plan.timeSpecifiers().forEach(time ->
            plan.getActionSet(time).forEach(a ->
                str.append(String.format("%0" + timeSpecifierSize + "d: (%" + actionSize + "s) [%4.2f]%n",
                    time, this.toShortString(a), ((float) a.getCost())))));
        return str.toString();
    }
}
